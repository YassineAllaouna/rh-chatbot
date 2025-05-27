import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    url: String
  }

  complete(event) {
    event.preventDefault()
    const button = event.currentTarget

    fetch(this.urlValue, {
      method: 'PATCH',
      headers: {
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content,
        'Accept': 'application/json'
      }
    })
    .then(response => response.json())
    .then(data => {
      if (data.error) {
        alert(data.error)
      } else {
        const stepItem = button.closest('.list-group-item')
        const progressBar = document.querySelector('.progress-bar')
        
        button.replaceWith('<span class="badge bg-success">Complété</span>')
        progressBar.style.width = `${data.progress}%`
        progressBar.textContent = `${data.progress}%`
        progressBar.setAttribute('aria-valuenow', data.progress)
      }
    })
    .catch(error => {
      console.error('Error:', error)
      alert('Une erreur est survenue lors de la complétion de l\'étape.')
    })
  }
} 