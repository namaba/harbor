import $ from 'jquery'
import 'select2/dist/css/select2.css'
import 'select2'

window.addEventListener('DOMContentLoaded', () => {
  $(".js-select2").select2({
    placeholder: "選択してください",
    theme: "material"
  });

  $(".talent-select2").select2({
    placeholder: "タレント選択してください",
    theme: "material"
  });

  $(".select2-selection__arrow")
    .addClass("material-icons")
    .html("arrow_drop_down");

  $("#talentSearch .select2-selection__rendered")
    .addClass("material-icons")
    .html("search");

})