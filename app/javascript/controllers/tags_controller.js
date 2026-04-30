// https://stimulus.hotwired.dev/reference/controllers

import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tags"


export default class extends Controller {

  static targets = ["count", "preview", "selectedTagPreview"]

  connect() {
    this.load()
    this.updateCounts()
    this.updateJsonPreview()
    this.updateSelectedTagPreview()
  }

  toggle(event) {
    const tagName = event.target.value
    const categoryName = event.target.dataset.categoryName

    let selected_tags = this.getSelectedTagsJson()

    if(!selected_tags[categoryName]) {
      selected_tags[categoryName] = []
    }

    if (event.target.checked) {
      selected_tags[categoryName].push(tagName)
    } else {
      selected_tags[categoryName] =
        selected_tags[categoryName].filter(name => name !== tagName)
    }

    sessionStorage.setItem("selectedTags", JSON.stringify(selected_tags))

    this.updateCounts()
    this.updateJsonPreview()
    this.updateSelectedTagPreview()

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

  collect() {
    return this.getSelectedTagsJson()
  }

  // https://developer.mozilla.org/ja/docs/Web/API/Window/sessionStorage
  getSelectedTagsJson() {
    return JSON.parse(sessionStorage.getItem("selectedTags") || "{}")
  }

  // 左カラム カテゴリの選択中のタグ数
  updateCounts() {
    const selected = this.getSelectedTagsJson()

    this.countTargets.forEach((countElement) => {
      const categoryName = countElement.dataset.categoryName
      countElement.textContent = selected[categoryName]?.length || 0
    })
  }

  // 右カラム 選択中のタグを表示
  updateSelectedTagPreview() {
    const collect = this.collect()
    
    const html_category = Object.keys(categoryMap).map((category) => {
      const tags = collect[category] || []

      if(tags.length == 0) return ""
      
      const categoryInfo = categoryMap[category];
      
      return [
        `<div class="preview-selected-category-title">`,
          `<span class="preview-category-dot" style="--category-color: ${categoryInfo.image_color};"></span>`,
          `<span>${categoryInfo.display_name}</span>`,
        `</div>`,
        `<div class="preview-selected-tag-list">`,
          tags.map(tag => `<div class="preview-selected-tag" style="--category-color: ${categoryInfo.image_color}">${tagMap[tag].display_name}</div>`).join(""),
        `</div>`
      ].join("");
    }).join("");

    this.selectedTagPreviewTarget.innerHTML = html_category;
  }

  // 右カラム JSONプレビューを表示
  updateJsonPreview() {
    const collect = this.collect()
    const jsonData = {}

    Object.keys(categoryMap).forEach((category) => {
      jsonData[category] = collect[category] || []
    })

    this.previewTarget.textContent = JSON.stringify(jsonData, null, 2)
  }
}