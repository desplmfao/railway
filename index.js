const express = require('express')
const app = express()
const port = 6969

app.get('/', (req, res) => {
  res.end('Hello World!')
})

app.listen(port, () => {
  console.log(`0.0.0.0:${port}`)
})
