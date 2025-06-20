resource "aws_key_pair" "aziza_key" {
  key_name   = "aziza-ed25519"
  public_key = file("~/.ssh/id_ed25519.pub")
}