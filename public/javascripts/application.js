jQuery.noConflict()


var estimates = new Array();
var phases = new Array();
var deliverables = new Array();


function pairSelected() {
  type = $('deliverable_deliverable_type').getValue();
  complexity = $('deliverable_complexity').getValue();
  if (complexity != '' && type != ''){
    for (i = 0; i < estimates.length; i++){
      if (estimates[i][0] == type && estimates[i][1] == complexity){
        jQuery('#min_effort').html(estimates[i][2]);
        jQuery('#max_effort').html( estimates[i][3]);
        jQuery('#avg_effort').html(estimates[i][4]);
        jQuery('#min_size').html(estimates[i][5]);
        jQuery('#max_size').html(estimates[i][6]);
        jQuery('#avg_size').html(estimates[i][7]);
        jQuery('#min_rate').html(estimates[i][8]);
        jQuery('#max_rate').html(estimates[i][9]);
        jQuery('#avg_rate').html(estimates[i][10]);
        jQuery('#stats_table').show();
        break;
     }
   }
 } else {
    jQuery('#stats_table').hide();
 }
}


function effortSelect() {

    project_id = $('_project_id').getValue();
    phase_id = $('_phase_id').getValue();
    pOptions = $('_phase_id').options
    pOptions.length = 1;
    phases.each(function(phase) {
        if (phase[0] == project_id) {
            pOptions[pOptions.length] = new Option(phase[1], phase[2])
        }
    });
    dOptions = $('effort_deliverable_id').options
    dOptions.length = 1;
    deliverables.each(function(deliverable) {
        if (deliverable[0] == phase_id) {
            dOptions[dOptions.length] = new Option(deliverable[1], deliverable[2])
        }
    });
}
