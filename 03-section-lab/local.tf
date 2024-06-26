# updates the resource pet
# setting file permissions to 0700
resource "local_file" "pet" {
  filename        = "pets.txt"
  content         = "We love pets"
  file_permission = "0700"
}
