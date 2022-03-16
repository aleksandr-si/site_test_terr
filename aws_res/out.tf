output "linux_latest" {
  value = data.aws_ami.latest_amazon_linux_usa.name
}
output "linux_latest_id" {
  value = data.aws_ami.latest_amazon_linux_usa.id
}
output "linux_latest_ger" {
  value = data.aws_ami.latest_amazon_linux_ger.id
}
output "linux_latest_id_ger" {
  value = data.aws_ami.latest_amazon_linux_ger.id
}
output "linux_latest_gb" {
  value = data.aws_ami.latest_amazon_linux_gb.name
}
output "linux_latest_id_gb" {
  value = data.aws_ami.latest_amazon_linux_gb.id
}