//jQuery.noConflict();


var estimates = new Array();
var phases = new Array();
var deliverables = new Array();
var deliverableTypes = new Array();


function calculateProductionRate(changed){
    if (isNaN(parseFloat(changed.value)) || parseFloat(changed.value) == 0) return false;
    size        = jQuery("#deliverable_estimated_size");
    effort      = jQuery("#deliverable_estimated_effort");
    rate        = jQuery("#deliverable_estimated_production_rate");
    sizeVal     = parseFloat(jQuery("#deliverable_estimated_size").val());
    effortVal   = parseFloat(jQuery("#deliverable_estimated_effort").val());
    rateVal     = parseFloat(jQuery("#deliverable_estimated_production_rate").val());

    if (changed.value != ''){
        if (changed.id == "deliverable_estimated_size"){
            if (!isNaN(effortVal) && effortVal != 0){
                rate.val( round(effortVal / sizeVal));
            } else if (!isNaN(rateVal) && rateVal != 0){
                effort.val( round(rateVal * sizeVal))
            } else {
                // do not calculate, because we need at least two values
            }
        }
        if (changed.id == "deliverable_estimated_effort"){
            if (!isNaN(sizeVal) && sizeVal != 0){
                rate.val( round(effortVal / sizeVal));
            } else if (!isNaN(rateVal) && rateVal != 0){
                size.val( round(effortVal / rateVal));
            } else {
                // do not calculate, because we need at least two values
            }
        }
        if (changed.id == "deliverable_estimated_production_rate"){
            if ((isNaN(sizeVal) || sizeVal == 0) && (!isNaN(effortVal) && effortVal != 0)){
                size.val( round(effortVal / rateVal));
            } else if (!isNaN(sizeVal) && sizeVal != 0){
                effort.val( round(rateVal * sizeVal));
            } else {
                // do not calculate, because we need at least two values
            }
        }
    }
}

function round(number){
    return Math.round(number*100)/100;
}

function changeUOM() {
  type = $('deliverable_deliverable_type').getValue();
  if (type == 'Ad-Hoc' || type == ''){
      if (type == 'Ad-Hoc') {
        jQuery('#deliverable_unit_of_measure').val( 'Unit of Measure');
        jQuery('#deliverable_unit_of_measure').show();
      }
      jQuery('.stats_table').css('visibility', 'hidden');
      jQuery('#unitOfMeasure').hide();
      return true;
  }
  for (i = 0; i < deliverableTypes.length; i++){
      if (deliverableTypes[i][1] == type){
          jQuery('#deliverable_unit_of_measure').val( deliverableTypes[i][0]);
          jQuery('#deliverable_unit_of_measure').hide();
          jQuery('#unitOfMeasure').html(deliverableTypes[i][0]);
          jQuery('#unitOfMeasure').show();
          break;
      }
  }
  return true;
}

function pairSelected() {
  changeUOM();
  type = $('deliverable_deliverable_type').getValue();
  complexity = $('deliverable_complexity').getValue();
  if (complexity != '' && type != ''){
    for (i = 0; i < estimates.length; i++){
      if (estimates[i][0] == type && estimates[i][1] == complexity){
        jQuery('#min_effort').html(round(estimates[i][2]));
        jQuery('#max_effort').html(round(estimates[i][3]));
        jQuery('#avg_effort').html(round(estimates[i][4]));
        jQuery('#min_size').html(round(estimates[i][5]));
        jQuery('#max_size').html(round(estimates[i][6]));
        jQuery('#avg_size').html(round(estimates[i][7]));
        jQuery('#min_rate').html(round(estimates[i][8]));
        jQuery('#max_rate').html(round(estimates[i][9]));
        jQuery('#avg_rate').html(round(estimates[i][10]));
        jQuery('.stats_table').css('visibility', 'visible');
        break;
     }
   }
 } else {
    jQuery('.stats_table').css('visibility', 'hidden');
 }
}

function phaseSelect(selectedPhase, selectedDeliverable) {
    phase_id = selectedPhase || jQuery('#_phase_id').val();
    dOptions = $('effort_deliverable_id').options
    dOptions.length = 1;
    deliverables.each(function(deliverable) {
        if (deliverable[0] == phase_id) {
            dOptions[dOptions.length] = new Option(deliverable[1], deliverable[2])
        }
    });
    if (selectedPhase) jQuery('#_phase_id').val(selectedPhase);
    if (selectedDeliverable) jQuery('#effort_deliverable_id').val( selectedDeliverable);
}

function projectSelect(selectedProject, selectedPhase, selectedDeliverable) {
   project_id = selectedProject || jQuery('#_project_id').val();
   pOptions = $('_phase_id').options
    pOptions.length = 1;
    phases.each(function(phase) {
        if (phase[0] == project_id) {
            pOptions[pOptions.length] = new Option(phase[1], phase[2])
        }
    });
    if (selectedProject && selectedPhase && selectedDeliverable){
       jQuery('#_project_id').val( selectedProject);
        phaseSelect(selectedPhase, selectedDeliverable);
    } else {
    $('effort_deliverable_id').options.length = 1;
    }
}


jQuery(function() {
    jQuery( ".datepicker" ).keydown(function(){
        return false;
    });
    jQuery( ".datepicker" ).datepicker({
        maxDate: 0
    });
});

jQuery(document).ready(function(){
    jQuery('#_project_id').change(function(){
        projectSelect()});
    jQuery('#_phase_id').change(function(){
        phaseSelect()});
    jQuery('#deliverable_unit_of_measure').hide();
    jQuery('.stats_table').css('visibility', 'hidden');
    jQuery( ".datepicker ").datepicker( "option", "showAnim", 'fadeIn' );
});