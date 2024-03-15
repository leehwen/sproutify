import { Controller } from "@hotwired/stimulus"
import Swal from 'sweetalert2'

// Connects to data-controller="delete-illness"
export default class extends Controller {
  connect() {
    console.log("hello delete")
  }

  click(e) {
    // console.log(e)
    e.preventDefault()

    const swalWithBootstrapButtons = Swal.mixin({
      customClass: {
        confirmButton: "btn sp-btn-green-confirm",
        cancelButton: "btn sp-btn-gray-delete me-3"
      },
      buttonsStyling: false
    });
    swalWithBootstrapButtons.fire({
      title: "Are you sure?",
      text: "You won't be able to revert this!",
      icon: "warning",
      showCancelButton: true,
      confirmButtonText: "Yes",
      cancelButtonText: "No",
      reverseButtons: true
    }).then((result) => {
      if (result.isConfirmed) {
        // console.log(this.#getMetaValue("csrf-token"))
        fetch(e.target.href, {
          method: "delete",
          header: {
            "Accept": "text/plain",
            "X-CSRF-Token": this.#getMetaValue("csrf-token")
          }
        })
        .then(response => response.text())
        .then((data) => {
          // window.location.reload()
        })

      } else if (
        /* Read more about handling dismissals below */
        result.dismiss === Swal.DismissReason.cancel
      ) {

      }
    });
  }

  clickDelete(e) {
    const url = e.currentTarget["href"]
    console.log(url)

    e.preventDefault()

    const swalWithBootstrapButtons = Swal.mixin({
      customClass: {
        confirmButton: "btn sp-btn-green-confirm",
        cancelButton: "btn sp-btn-gray-delete me-3"
      },
      buttonsStyling: false
    });
    swalWithBootstrapButtons.fire({
      title: "Are you sure?",
      text: "You won't be able to revert this!",
      icon: "warning",
      showCancelButton: true,
      confirmButtonText: "Yes",
      cancelButtonText: "No",
      reverseButtons: true
    }).then((result) => {
      if (result.isConfirmed) {
        // console.log(this.#getMetaValue("csrf-token"))
        fetch(url, {
          method: "delete",
          header: {
            "Accept": "text/plain",
            "X-CSRF-Token": this.#getMetaValue("csrf-token")
          }
        })
        .then(response => response.text())
        .then((data) => {
          window.location.reload()
        })

      } else if (
        /* Read more about handling dismissals below */
        result.dismiss === Swal.DismissReason.cancel
      ) {

      }
    });
  }

  #getMetaValue(n) {
    const element = document.head.querySelector(`meta[name="${n}"]`)
    return element.getAttribute("content")
  }
}
