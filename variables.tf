                                                                                                   
variable "project" {}                                                          
variable "region" {}                                                           
variable "zone" {}                                                             
                                                                                
variable "public_ip" {}                                                        
                                                                                
variable "public_key_path" {                                                   
description = "Path to file containing public key"                           
  default     = ".ssh/gcloud_rsa.pub"                                          
}                                                                              

variable "private_key_path" {                                                  
  description = "Path to file containing private key"                          
  default     = ".ssh/gcloud_rsa"                                              
}                                                                              
                           
