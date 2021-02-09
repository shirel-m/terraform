module "publisher" {
  source = "./publisher"
}

module "consumer" {
  source = "./consumer"
  subnet_arn = module.service1.subnet_arn
  test_value = module.service1.test_value1
  test_value2 = module.service1.test_value2
  test_value3 = module.service1.test_value3
  test_value4 = module.service1.test_value4
}

output "subnet_arn" {
    value = module.service2.input_subnet_arn
}

output "value1" {
    value = module.service2.input_value1
}

output "value2" {
    value = module.service2.input_value2
}

output "value3" {
    value = module.service2.input_value3
}

output "value4" {
    value = module.service2.input_value4
}

