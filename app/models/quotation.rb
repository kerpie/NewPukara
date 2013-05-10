class Quotation < ActiveRecord::Base
  attr_accessible :client_id, 
                  :user_id,
                  :code, 
                  :date, 
                  :money_expected, #Dinero siempre en soles
                  :payment_status,
                  :quotation_details_attributes

  validates :client_id, :presence => {:message => " no puede estar vacio"}
  validates :user_id, :presence => {:message => " no puede estar vacio"}
  validates :date, :presence => {:message => " no puede estar vacio"}

  has_many :quotation_details, :dependent => :destroy
  has_many :payments
  has_one :output_folder             
  belongs_to :user
  belongs_to :money_type
  belongs_to :client

  accepts_nested_attributes_for :quotation_details

  def change(in_soles, in_dollars)
    total = 0
    quotation_details.each do |qd|
      total = total + (qd.money_value * qd.sell_price * qd.quantity)
    end
    
    hash = Hash.new

    mt = MoneyType.where("name like ?", "%dol%").first

    total_received = in_soles + (in_dollars*mt.value)

    hash["Faltan en Dolares"] = ((total-total_received)/mt.value).round(2)
    hash["Faltan en Soles"] = (total - total_received).round(2)
    hash 
  end

  def docs_to_generate
    type = client.client_type
    docs = []
    if type == ClientType.where("name like ?", "%EMP%").first #Empresa
      docs << DocumentType.where("name like ?", "%FAC%").first
      docs << DocumentType.where("name like ?", "%GU%").first
    else
      docs << DocumentType.where("name like ?", "%BOLE%").first
    end
    docs
  end

  def approve_payment(payment_in_soles, payment_in_dollars, docs_to_generate, numerations_complete)
    if numerations_complete
      unless payment_in_soles.empty?
        payment = Payment.new
        payment.money_type_id = MoneyType.where("name like ?", "%SOL%").first.id
        payment.quotation_id = id 
        payment.money_received = payment_in_soles
        payment.money_value = 1
        payment.save
      end

      unless payment_in_dollars.empty?
        payment = Payment.new
        money = MoneyType.where("name like ?", "%DOL%").first
        payment.money_type_id = money.id
        payment.quotation_id = id 
        payment.money_received = payment_in_dollars
        payment.money_value = money.value
        payment.save
      end

      output_folder = OutputFolder.new
      output_folder.client = client
      output_folder.folder_state_id = FolderState.last.id
      output_folder.user_id = user_id
      output_folder.date = Time.now
      output_folder.quotation_id = id 
      output_folder.save 

      #Documents for the folder
      docs_to_generate.each do |doc|
        output_document = OutputDocument.new
        output_document.document_type_id = doc.id 
        output_document.output_folder_id = output_folder.id

        numeration = Numeration.where(:document_type_id => doc, :store_id => user.store).first
        output_document.numeration = numeration.current_number

        output_document.save

        numeration.current_number = numeration.current_number + 1
        numeration.save
      end

      #Document detail for the folder
      quotation_details.each do |qd|
        output_document_detail = OutputDocumentDetail.new
        output_document_detail.product_id = qd.product_id
        output_document_detail.sell_price = qd.sell_price
        output_document_detail.quantity = qd.quantity/Unit.find(qd.unit_id).value
        output_document_detail.output_folder_id = output_folder.id
        output_document_detail.unit_id = qd.unit_id
        output_document_detail.save

        qd.temporal_numerations.each do |tn|
          output_code = OutputCode.new
          output_code.registered_code = tn.temporal_code
          output_code.output_document_detail_id = output_document_detail.id
          output_code.save
        end
      end
      output_folder
    end
  end
end