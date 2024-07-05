# tractian_application

PT/BR 🇧🇷
- Projeto proposto pela equipe da Tractian. Onde são mostrados duas telas principais. Uma tela onde são mostradas uma lista de empresas que possuem a opção de clicar ver detalhes sobre os assets, locations e components. Nesse projetoem específico tentei utilizar uma quantidade mínima de pacotes.

## Autor
- Guilherme Fonseca [Github](https://github.com/fonsecguilherme) e [Linkedin](https://www.linkedin.com/in/devfonsecguilherme/)

## Stack 
Dart and Flutter
**Packages:** [Flutter SVG](https://pub.dev/packages/flutter_svg), [Provider](https://pub.dev/packages/provider), [HTTP]( https://pub.dev/packages/http)

## Gerenciamento de estados e Injeção de Dependência
- Como citado anteriormente, para esse projeto tentei usar uma quantidade mínima de dependências externas. Para gerenciamento de estados decidi usar as soluções disponibilizadas pelo próprio Flutter para fazer esse gerenciamento de estados junto com o padrão State Pattern. O que torna o código bem legível além de separar a regra de negócio da UI. Para injeção de dependência, usei o popular pacote provider.  

## Pontos de melhorias
- Como ponto de melhoria eu implementaria a funcionalidade de ao selecionar um filtro crítico ou de energia, mostrar o item pai e os filhos ao invés de conseguir puxar apenas os itens pais que tem o sensor  de nergia ou que está com o status crítico.

## Video
[Video](https://drive.google.com/file/d/1BI6TWlsdRHF6qbDroyqHmTLd3WtD-JnT/view?usp=sharing)

## Screenshots
* Home page iOS/Android
<p float="left">
  <img src="https://github.com/fonsecguilherme/tractian_repo/assets/43682827/21d6b399-3c47-4459-a9f8-58f075c5bf7b" width="350" />
  <img src="https://github.com/fonsecguilherme/tractian_repo/assets/43682827/1f239f25-1aaf-4597-a6a0-ef3d3328ab72" width="350" />
</p>

* Assets page iOS
<p float="left">
  <img src="https://github.com/fonsecguilherme/tractian_repo/assets/43682827/ce43fa0c-3488-4b26-81f9-fe273e064423" width="350" />
  <img src="https://github.com/fonsecguilherme/tractian_repo/assets/43682827/0e2deed0-e01d-438d-849c-6055d9360fea" width="350" />
  <img src="https://github.com/fonsecguilherme/tractian_repo/assets/43682827/a53da24f-76bf-4483-8709-bc28b6acbba8" width="350" />
  <img src="https://github.com/fonsecguilherme/tractian_repo/assets/43682827/59e4a6a4-01da-49b4-97a2-b25a4d2b393e" width="350" />
</p>

* Assets page Android
<p float="left">
  <img src="https://github.com/fonsecguilherme/tractian_repo/assets/43682827/7fc547b8-3b61-4f3a-a6b5-7255957fdab5" width="350" />
  <img src="https://github.com/fonsecguilherme/tractian_repo/assets/43682827/b56dd2ca-7bcf-48cf-835d-7fb373a96e22" width="350" />
  <img src="https://github.com/fonsecguilherme/tractian_repo/assets/43682827/36ab19de-5412-451c-b817-93f929b056ee" width="350" />
  <img src="https://github.com/fonsecguilherme/tractian_repo/assets/43682827/cc97ee18-9b66-4b1a-9cfc-6d56b65c5a8b" width="350" />  
</p>

* Assets page Filtros
<p float="left">
  <img src="https://github.com/fonsecguilherme/tractian_repo/assets/43682827/04f17e81-43b5-4402-bea1-130f628b6802" width="350" />
  <img src="https://github.com/fonsecguilherme/tractian_repo/assets/43682827/5e8b3375-4059-4f81-97c0-28dc6b7f512b" width="350" />
  <img src="https://github.com/fonsecguilherme/tractian_repo/assets/43682827/9c47b03d-6019-4679-97c8-8e4e2bf71abe" width="350" />
</p>

Project instructions link: https://github.com/tractian/challenges/blob/main/mobile/README.md
