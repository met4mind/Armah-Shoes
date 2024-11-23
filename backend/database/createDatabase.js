let isForce = process.argv.pop()
if (isForce !== "--force") {
	console.error("please pass --force to re-create database")
	process.exit(1)
}
import { config } from "dotenv"
import { readFileSync } from "fs"
import mysql from "mysql2/promise"
config()
mysql.createConnection({ host: process.env.DB_HOST, user: process.env.DB_USER, password: process.env.DB_PASS, multipleStatements: true }).then(async connection => {
	let queries = readFileSync(`${import.meta.dirname}/schema.sql`)
		.toString()
		.split(";\r\n")
	for await (const query of queries) {
        try {
            await connection.query(`${query};`)
        } catch (error) {
            if (error.sqlMessage != "Query was empty") throw error
        }
	}
    console.log(`Done`)
    process.exit(0)
})
//1.73