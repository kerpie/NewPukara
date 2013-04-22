// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

function update_form(parent, element){
	$(parent).hide();
	$("#"+element).show();
}

function destroy_form(parent, element){
	$(parent).hide();
	$("#"+element).show();	
}

function add_fields(link, association, content){
	var new_id = new Date().getTime();
	var regexp = new RegExp("[\d]+")
	var regexp = new RegExp("new_"+association,"g");
	$(link).parent().before(content.replace(regexp, new_id));
	$("#kid_").attr('id', "kid_"+new_id);
	$("#mid_").attr('id', "mid_"+new_id);
}

function add_q_fields(link, association, content){
	var new_id = new Date().getTime();
	var regexp = new RegExp("[\d]+")
	var regexp = new RegExp("new_"+association,"g");
	$("#untouchable_row").before(content.replace(regexp, new_id))
}

function submitForm(link){
	$(link).parents("form").submit();
}

function showVendors(link){
	var tmp = $(link).parent().hasClass('selected_change_vendor');
	if(tmp){
		$("#vendor_list").hide();
		$("#change_vendor").removeClass('selected_change_vendor');	
	}
	else{
		$("#vendor_list").show();
		$("#change_vendor").addClass('selected_change_vendor');
	}
}

function test(){
	alert("Hola Mundo!");
}

function checkStockFormShow(link){
	var tmp = $(link).hasClass('selected_link');
	$('#check_stock_result').hide();
	if(tmp){
		$('#check_stock').hide();
		$(link).removeClass('selected_link');
	}
	else{
		$('#client_search_link').removeClass('selected_link');
		$('#client_search').hide();
		$('#check_stock').show();
		$(link).addClass('selected_link');
	}
}

function check_stock_again(){
	$('#check_stock_result').hide();
	$('#check_stock').show();
}

function clientSearchFormShow(link){
	var tmp = $(link).hasClass('selected_link');
	$('#client_search_result').hide();
	$('#client_register').hide();
	if(tmp){
		$('#client_search').hide();
		$(link).removeClass('selected_link');
	}
	else{
		$("#check_stock_link").removeClass('selected_link');
		$('#check_stock').hide();
		$('#client_search').show();
		$(link).addClass('selected_link');
	}
}

function submitLastForm(){
	$('#last_submit_button').trigger('click');
}

$(function(){
	$('#product_search_parent_model').change(function(){
		$('#submit_button').trigger('click');
	});
	$('#product_search_type').change(function(){
		$('#submit_button').trigger('click');
	});
	$('#product_search_brand').live('change',function(){
		$('#second_submit_button').trigger('click');
	});
	$('#product_search_model_type').live('change',function(){
		$('#second_submit_button').trigger('click');
	});
	$('#product_search_brand').live('change',function(){
		$('#second_submit_button').trigger('click');
	});

	//Marcas
	$("#select_parent_model").change(function(){
		$("#submit_first_part").trigger('click');
	});

});

function showClientSearch(){
	$("#client_search").hide();
	$("#client_search_result").show();
}

function showRegisterClient(){
	$("#client_search").hide();
	$("#client_register").show();
}

function searchClient(){
	$("#client_seach_submit_button").trigger('click');
}

//Mostrar menu para registrar marcas y modelos
function showBrandMenu(link){

	$(link).parents('li').addClass('selected_link');
	$(link).addClass('selected_link');

	$("#new_brand_form").hide();
	$("#new_class_form").hide();
	$("#new_parent_model_form").hide();
	$("#new_model_type_form").hide();
	$("#new_model_form").hide();
	$("#model_type_index").hide();
	$("#parent_model_index").hide();

	$("#brand_menu").show();
}

function registerBrandForm(link){
	hideBrandsMenu(link);
	$("#new_brand_form").show();
}

function registerClassForm(link){
	hideBrandsMenu(link);
	$("#new_class_form").show();
}

function registerModelTypeForm(link){
	hideBrandsMenu(link);
	$("#new_model_type_form").show();
}

function registerModelForm(link){
	hideBrandsMenu(link);
	$("#new_model_form").show();
}

function hideBrandsMenu(link){
	$(link).parents(".floating_part").hide();
}

//Pulsar boton para enviar formulario
function submitRegularForm(link){
	$(link).parent().next('.submit_part').find('input').trigger('click');

	value = $(link).parents(".parent_model_edit");
	if(value){
		$(value).hide();
	}
}

//Products
function submitProduct(link){
	$(link).parent().next("#new_product_submit_button").find("input").trigger('click');
}

//Suppliers
function submitNewSupplier(link){
	$(link).parent().next(".actions").find("input").trigger('click');	
}

//DocumentType
function submitUpdateDocTypeForm(link){
	$(link).parent().next(".dt_update_form_div_submit").find("input").trigger('click');
}

function submitCreateDocTypeForm(link){
	$(link).parent().next(".dt_create_form_div_submit").find("input").trigger('click');	
}

//PriceType
function showCreatePriceTypeForm(){
	$("#create_price_type")[0].reset();
	$("#create_price_type").parents(".floating_box").show();
}

function updatePriceTypeForm(id, name, discount){
	$("#ptupdate_id").val(id);
	$("#up_name").val(name);
	$("#up_discount").val(discount);
	$("#update_price_type").parents(".floating_box").show();
}

//EntryFolder
function submitCreateEntryFolderForm(link){
	$(link).parent().next("#entry_folder_submit_button").find("input").trigger('click');	
}

function useThisSupplier(link){
	$(link).parents(".floating_part").hide();

	if($(".search_part").length){
		$("#supplier").val($("#new_supplier_to_change li input:checked").val());
		$("#supplier_name").val($("#new_supplier_to_change li input:checked").next("span").html());
	}
	else{
		$("#entry_folder_supplier_id").val($("#new_supplier_to_change li input:checked").val());
		$("#sup_id").html($("#new_supplier_to_change li input:checked").next("span").html());
		$("#sup_id").show();
	}
}

function showSupplierSearch(){
	$("#supplier_search").show();
	$("#name").focus();
}

//OutputFolder
function useThisClient(link){
	$(link).parents(".floating_part").hide();

	$("#output_folder_client_id").val($("#new_client_to_change li input:checked").val());
	$("#clnt_id").html($("#new_client_to_change li input:checked").next("span").html());
	$("#clnt_id").show();
}

function showClientSearch(){
	$("#of_client_search").show();
}

function submitCreateOutputFolderForm(link){
	$(link).parent().next("#output_folder_submit_button").find("input").trigger('click');	
}

//ClientType updateform
function updateClientTypeForm(id, name, type, q){
	$("#ctupdate_id").val(id);
	$("#up_name").val(name);
	$("#up_identification_type").val(type);
	$("#up_identification_quantity").val(q);
	$("#update_client_type").parents(".floating_box").show();
}

function showCreateClientTypeForm(){
	$("#create_client_type")[0].reset();
	$("#create_client_type").parents(".floating_box").show();
}

function hideFloatingBox(link){
	$(link).parents(".floating_box").hide();
}

function deleteClientType(link){
	$(link).next('.delete_ct').find(".destroy_client_type").trigger("click");
}

//MoneyType updateform
function updateMoneyTypeForm(id, name, value){
	$("#mtupdate_id").val(id);
	$("#up_name").val(name);
	$("#up_value").val(value);
	$("#update_money_type").parents(".floating_box").show();
}

function showCreateMoneyTypeForm(){
	$("#create_money_type")[0].reset();
	$("#create_money_type").parents(".floating_box").show();
}

function hideFloatingBox(link){
	$(link).parents(".floating_box").hide();
}

function deleteMoneyType(link){
	$(link).next('.delete_mt').find(".destroy_money_type").trigger("click");
}

//Quotation 
function closeFloatingBox(link){
	$(link).parents(".q_box").hide();
}

//Document Numeration 
function showNumerationUpdateForm(link){
	$("#update_numeration_form").show();
	$(".window_content_part h2").text("Modificando " + $(link).parents("tr").find(".document_type").text())
	$("#st_id").val($(link).parents(".order_by_store").attr('id'));
	$("#dt_id").val($(link).parents("tr").find(".document_type").attr("data-doc_type_id"));
	$("#initial_number").val($(link).parents("tr").find(".initial_number").text());
	$("#current_number").val($(link).parents("tr").find(".current_number").text());
}

function closeWindow(link){
	$(link).parents(".window").hide();
}