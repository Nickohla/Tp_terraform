resource "random_string" "test" {
    length = 10
    special = true
}

resource "random_id" "personne" {
    byte_length = 10
}

resource "local_file" "random" {
  content = "${random_string.test.result} ${random_id.personne.hex} ${var.personne_civ} ${var.personne_prenom} ${var.personne_nom} ${var.personne_exp} ${var.personne_domaine}" 
  filename = "${path.module}/random.txt"
    depends_on = [
      random_string.test
    ]
}

# resource "local_file" "personne_civ" {
#     filename = "${path.module}/random.txt"
#     content = var.personne_civ
  
# }

# resource "local_file" "personne_prenom" {
#     filename = "${path.module}/random.txt"
#     content =var.personne_prenom
# }

# resource "local_file" "personne_nom" {
#     filename = "${path.module}/random.txt"
#     content = var.personne_nom
# }

# resource "local_file" "personne_exp" {
#     filename = "${path.module}/random.txt"
#     content =var.personne_exp
# }

# resource "local_file" "personne_domaine" {
#     filename = "${path.module}/random.txt"
#     content = var.personne_domaine
  
# }
