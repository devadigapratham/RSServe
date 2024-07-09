package main

import (
	"fmt"
	"log"
	"os"

	"github.com/joho/godotenv"
)

func main() {

	portString := os.Getenv("PORT")
	godotenv.Load(".env")

	if portString == "" {
		log.Fatal("Port not found lol")
	}

	fmt.Println("Port: ", portString)
}
