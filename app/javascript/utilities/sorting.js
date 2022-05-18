document.addEventListener('turbolinks:load', () => {
    let control = document.querySelector('.sort-by-title')
    if (control) control.addEventListener('click', sortRowsByTitle)
})

function sortRowsByTitle() {
    const table = document.querySelector('table')
    const rows = table.querySelectorAll('.tests-row')
    const header = table.querySelector('.tests-header')
    let sortedRows = []

    rows.forEach(row => sortedRows.push(row))

    if (this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
        sortedRows.sort((a, b) => a.querySelector('td').textContent.toLowerCase() > b.querySelector('td').textContent.toLowerCase() ? 1 : -1)
        this.querySelector('.octicon-arrow-up').classList.remove('hide')
        this.querySelector('.octicon-arrow-down').classList.add('hide')
    } else {
        sortedRows.sort((a, b) => a.querySelector('td').textContent.toLowerCase() < b.querySelector('td').textContent.toLowerCase() ? 1 : -1)
        this.querySelector('.octicon-arrow-down').classList.remove('hide')
        this.querySelector('.octicon-arrow-up').classList.add('hide')
    }

    let sortedTable = document.createElement('table')
    const tableClasses = ['table', 'table-striped', 'table-hover']
    sortedTable.classList.add(...tableClasses)
    sortedTable.appendChild(header)
    sortedTable.appendChild(document.createElement('tbody'))

    let tableBody = sortedTable.querySelector('tbody')
    sortedRows.forEach(row => tableBody.appendChild(row))

    table.parentNode.replaceChild(sortedTable, table)
}
