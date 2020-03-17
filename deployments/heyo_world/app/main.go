package main

import (
	"fmt"
	"log"
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "heyo boyo\n\n")
	fmt.Fprintf(w, "path: %s", r.URL.Path)
}

func main() {
	fmt.Println("heyo boyo")
	http.HandleFunc("/", handler)
	log.Fatal(http.ListenAndServe("0.0.0.0:80", nil))
}
