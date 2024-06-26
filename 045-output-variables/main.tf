resource "local_file" "pet" {
  filename = var.filename
  content  = var.filecontent
}

output "pet-name" {
  value = local_file.pet.filename
}
