variable "ami_id" {
    type = string
}

variable "instance_type" {
    type = string
  
}

variable "key_name" {
    type = string
  
}

variable "vpc_cidr_block" {
  type = string

}

variable "subnet_cidr_block" {
  type = list(string)

}


variable "az" {
  type = list(string)

}

variable "public_ip" {
  type = bool

}
