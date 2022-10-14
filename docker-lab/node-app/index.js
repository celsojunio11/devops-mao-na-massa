const express = require('express')
const redis = require('redis')

const app = express()
const client = redis.createClient()

client.set('visits', 0);