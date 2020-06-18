console.log('home')
document.addEventListener('DOMContentLoaded', () => {
  let button = document.getElementById('admin-button')
  button.addEventListener('click', event => {
    let span = document.getElementById('result')
    let xhr = new XMLHttpRequest()
    let onload = () => {
      let result = xhr.status == 200 ? 'Yes' : 'No'
      span.innerText = result
      setTimeout(() => span.innerText = null, 1000)
    }
    xhr.onload = onload
    xhr.open('GET', '/home/admin')
    xhr.send()
  })
})
