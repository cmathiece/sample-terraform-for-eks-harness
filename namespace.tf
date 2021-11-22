resource "kubernetes_namespace" "mlops" {
  metadata {
    annotations = {
      name = "example-annotation"
    }

    labels = {
      mylabel = "label-value"
    }

    #name = "terraform-example-namespace"
    name = "mlops"
  }
}
