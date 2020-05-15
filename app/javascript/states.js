import $ from 'jquery'
import 'select2/dist/css/select2.css'
import 'select2'

window.addEventListener('DOMContentLoaded', () => {
  $('.select2').select2(
    {
      dropdownAutoWidth: true,
      width: '100%',
      placeholder: "Classic Theme",
      theme: "classic"
    }
  )
})