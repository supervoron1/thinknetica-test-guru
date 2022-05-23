document.addEventListener('turbolinks:load', function () {
    let bar = document.querySelector('.progress-bar')

    if (bar) {
        let progress = bar.dataset.current / bar.dataset.total * 100
        bar.style.width = `${progress}%`
    }
})