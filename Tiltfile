# -*- mode: Python -*-

load('ext://uibutton', 'cmd_button', 'location')
load('ext://namespace', 'namespace_create', 'namespace_inject')
load('ext://helm_resource', 'helm_resource', 'helm_repo')

label_tp = 'third_party'

ingress_ns = 'ingress'
namespace_create(ingress_ns)
helm_repo('ingress-nginx-repo', 'https://kubernetes.github.io/ingress-nginx')
helm_resource(
    'ingress',
    'ingress-nginx-repo/ingress-nginx',
    resource_deps=['ingress-nginx-repo'],
    namespace=ingress_ns,
    labels=[label_tp],
    port_forwards=['8080:80'],
    flags=['--set=controller.admissionWebhooks.enabled=false', '--version=4.11.2'],
)

camunda_ns = 'camunda'
namespace_create(camunda_ns)
helm_repo('camunda-repo', 'https://helm.camunda.io')
helm_resource(
    'camunda',
    'camunda-repo/camunda-platform',
    resource_deps=['camunda-repo'],
    namespace=camunda_ns,
    labels=[label_tp],
    flags=['--values=./camunda-values.yaml', '--version=10.4.0'],
)
