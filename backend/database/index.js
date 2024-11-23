import {config as dotEnvConfig} from "dotenv"
import mysql from "mysql2/promise"
let parsedENV = dotEnvConfig({path: ".env"})
if (parsedENV.error) {
    console.error(parsedENV.error)
    process.exit(1)
}

const connection = mysql.createPool({ host: process.env.DB_HOST, user: process.env.DB_USER, password: process.env.DB_PASS,database: process.env.DB_DBNAME,port: process.env.DB_PORT, multipleStatements: true })

export default connection