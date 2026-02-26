resource block:
resource "local_file" "foo" {
    content  = "foo!"	
    filename = "/root/foo.txt"
}