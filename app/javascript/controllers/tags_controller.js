// https://stimulus.hotwired.dev/reference/controllers

import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tags"


export default class extends Controller {

  static targets = ["count"]

  connect() {
    this.load()
    this.updateCounts()
  }

  toggle(event) {
    const tagId = event.target.value
    const categoryName = event.target.dataset.categoryName

    let selected_tags = this.getSelectedTagsJson()

    if(!selected_tags[categoryName]) {
      selected_tags[categoryName] = []
    }

    if (event.target.checked) {
      selected_tags[categoryName].push(tagId)
    } else {
      selected_tags[categoryName] =
        selected_tags[categoryName].filter(id => id !== tagId)
    }

    sessionStorage.setItem("selectedTags", JSON.stringify(selected_tags))

    this.updateCounts()

    console.log(selected_tags)
  }

  load() {
    const selected_tags = this.getSelectedTagsJson()
    
    this.element.querySelectorAll("input[type=checkbox]").forEach(item => {
      const categoryName = item.dataset.categoryName
      
      if (selected_tags[categoryName]?.includes(item.value)) {
        item.checked = true
      }
    })
  }

  // https://developer.mozilla.org/ja/docs/Web/API/Window/sessionStorage
  getSelectedTagsJson() {
    return JSON.parse(sessionStorage.getItem("selectedTags") || "{}")
  }

  updateCounts() {
    const selected_tags = this.getSelectedTagsJson()

    this.countTargets.forEach((countElement) => {
      const categoryName = countElement.dataset.categoryName
      countElement.textContent = selected_tags[categoryName]?.length || 0
    })
  }
}