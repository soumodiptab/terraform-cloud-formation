resource "aws_key_pair" "demo-key-pair" {
    key_name   = var.AWS_KEY_PAIR_NAME
    public_key = file(var.AWS_KEY_PAIR_PUBLIC_PATH)
}