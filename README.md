# Faastruby

FaaStRuby (https://faastruby.io/) é uma plataforma Serverless para desenvolvedores Ruby. Seu objetivo é prover serviços e toda a infraestrutura necessária para “funções” FaaS rodarem na nuvem, estarem disponíveis quando necessárias e executarem em tempo hábil.

## Requisitos

- ruby 2.6.0
- Gem FaaStRuby

Install RVM
```
$ gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

$ curl -sSL https://get.rvm.io | bash -s stable --ruby
```
## Passa-a-passo de como criar uma função

01 - Criar um diretório
```
$ mkdir faastruby
$ cd faastruby
```
02 - Gerenciando a versão com RVM
```
$faastruby\> rvm use ruby-2.6.0@faastruby --ruby-version --create
```
03 -Instalar a GEM do CLI do faastruby
```
$faastruby\> gem install faastruby
```
04 - Checando versão
```
$faastruby\> faastruby -v
```
05 - Checando as opções
``` 
$faastruby\> faastruby -h
```
06 - Comando para criar um workspace na faastruby.io e um diretório local
``` 
$faastruby\> faastruby create-workspace sua-workspace --create-local-dir -e seu-email@mail.com
```
07 - Checando as credenciais
``` 
$faastruby\> cat ~/.faastruby.tor1
```
08 - Comando para listar seus workspaces
``` 
$faastruby\> faastruby list-workspace sua-workspace
```
09 - Acessar workspace local
``` 
$faastruby\> cd sua-workspace
```
10 - Criando a função
``` 
$faastruby\sua-workspace\> faastruby new hello-world
$faastruby\sua-workspace\> cd hello-world
$faastruby\sua-workspace\hello-world>
```
11 - Arquivo para criar as funções
```
$faastruby\sua-workspace\hello-world> vim handler.rb

def handler event
  render text: "Hello, World!\n"
end
```
13 - Arquivo de testes
```
$faastruby\sua-workspace\hello-world> vim spec/handler_spec.rb

require 'spec_helper'
$faastruby\sua-workspace\hello-world>require 'handler'

describe 'handler(event)' do
  let(:event) {SpecHelper::Event.new}

  it 'should return a String' do
    body = handler(event).call.body
    expect(body).to be_a(String)
  end
  it 'should reply Hello, World!' do
    body = handler(event).call.body
    expect(body).to be == "Hello, World!\n"
  end
end
```
14 - Testando o servidor local
```
$faastruby\sua-workspace\hello-world>cd ../..
$faastruby\> faastruby server
```
15 - Deploy no FaaStRuby cloud
```
$faastruby\sua-workspace\hello-world> faastruby deploy-to sua-workspace
```