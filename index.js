const express = require('express')
const app = express()
const port = process.env.PORT ?? 3000

app.get('/', (req, res) => {
  res.end('Hello World!')
})

app.listen(port, () => {
  console.log(`0.0.0.0:${port}`)
})
