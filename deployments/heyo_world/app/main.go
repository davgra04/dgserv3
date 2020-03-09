package main

import (
	"fmt"
	"log"
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "heyo boyo")
	fmt.Fprintf(w, "path: %s!", r.URL.Path[1:])
}

func main() {
	fmt.Println("heyo boyo")
	http.HandleFunc("/", handler)
	log.Fatal(http.ListenAndServe("0.0.0.0:80", nil))
}
