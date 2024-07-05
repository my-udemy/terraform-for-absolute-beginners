resource "local_file" "pet" {
  filename = "pets.txt"
  content = "we love pets!"
}