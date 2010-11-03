//jQuery.noConflict();


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

function phaseSelect(selectedPhase, selectedDeliverable) {
    phase_id = $('_phase_id').getValue() || selectedPhase;
    dOptions = $('effort_deliverable_id').options
    dOptions.length = 1;
    deliverables.each(function(deliverable) {
        if (deliverable[0] == phase_id) {
            dOptions[dOptions.length] = new Option(deliverable[1], deliverable[2])
        }
    });
    if (selectedPhase) jQuery('#_phase_id').attr('value', selectedPhase);
    if (selectedDeliverable) jQuery('#effort_deliverable_id').attr('value', selectedDeliverable);
}

function projectSelect(selectedProject, selectedPhase, selectedDeliverable) {
    project_id = $('_project_id').getValue() || selectedProject;
    pOptions = $('_phase_id').options
    pOptions.length = 1;
    phases.each(function(phase) {
        if (phase[0] == project_id) {
            pOptions[pOptions.length] = new Option(phase[1], phase[2])
        }
    });
    if (selectedProject && selectedPhase && selectedDeliverable){
       jQuery('#_project_id').attr('value', selectedProject);
        phaseSelect(selectedPhase, selectedDeliverable);
    } else {
    $('effort_deliverable_id').options.length = 1;
    }
}
