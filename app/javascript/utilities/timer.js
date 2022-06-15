document.addEventListener('turbolinks:load', () => {
    const seconds = document.querySelector('#seconds')
    const href = window.location.href

    if (seconds) {
        // saves from user changing time in devtools
        base_seconds = seconds.textContent

        let interval = setInterval(() => {
            seconds.textContent = base_seconds -= 1

            if (base_seconds <= 0) {
                window.location.href = window.location.href + '/result'
            }

            if (window.location.href !== href) {
                clearInterval(interval)
            }
        }, 1000)
    }
}, true)