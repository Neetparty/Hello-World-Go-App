package main

import (
	"fmt"
	"net/http"
)

func main() {

	// Serve static files
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello, World!")
	})

	http.ListenAndServe(":8080", nil)
}
