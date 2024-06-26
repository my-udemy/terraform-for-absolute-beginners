resource "local_file" "whale" {
  filename = "./root/whale"
  content  = "whale"
}

resource "local_file" "krill" {
  filename   = "./root/krill"
  content    = "krill"
  depends_on = [local_file.whale]
}
