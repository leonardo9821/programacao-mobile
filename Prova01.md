
# Equipe

- Leonardo de Paula Teixeira
- Ícaro de Assis Hostert
## Prototipo04
## 1. AppBar

**Descrição**:
O AppBar é um componente de barra de navegação que exibe o título da aplicação. Neste exemplo, ele contém o logo do restaurante e o nome "Restaurante Japonês".

**Aplicações**:
A aplicação deste componente é garantir que o título da aplicação esteja visível e personalizado, enquanto o logo também se destaca visualmente na tela.

**Como usar**:
```dart
appBar: AppBar(
  title: FittedBox(
    child: Row(
      children: [
        Image.asset(
          'assets/images/uzumaki.png',  // Caminho do ícone salvo
          width: 60, // Ajuste o tamanho do ícone se necessário
          height: 60,
        ),
        SizedBox(width: 10),
        Text('Restaurante Japonês'),
      ],
    ),
  ),
  centerTitle: true,
)
A seguir está a estrutura para o arquivo `prova01.md`, que detalha o código de estilização utilizado na aplicação Flutter com base nas exigências do seu tutorial. Vou comentar cada parte do código e como ele foi feito:

````markdown
# Equipe

- Leonardo de Paula Teixeira
- Ícaro de Assis Hostert

## 1. AppBar

**Descrição**:
O AppBar é um componente de barra de navegação que exibe o título da aplicação. Neste exemplo, ele contém o logo do restaurante e o nome "Restaurante Japonês".

**Aplicações**:
A aplicação deste componente é garantir que o título da aplicação esteja visível e personalizado, enquanto o logo também se destaca visualmente na tela.

**Como usar**:
```dart
appBar: AppBar(
  title: FittedBox(
    child: Row(
      children: [
        Image.asset(
          'assets/images/uzumaki.png',  // Caminho do ícone salvo
          width: 60, // Ajuste o tamanho do ícone se necessário
          height: 60,
        ),
        SizedBox(width: 10),
        Text('Restaurante Japonês'),
      ],
    ),
  ),
  centerTitle: true,
)
````

**Explicação**:

- O `FittedBox` garante que o título se ajuste adequadamente no espaço.
    
- O `Row` é utilizado para colocar a imagem e o texto lado a lado.
    
- O `SizedBox` é usado para adicionar um pequeno espaçamento entre o logo e o texto.
    

## 2. Wrap (Filtros de Categoria)

**Descrição**: O `Wrap` é utilizado para exibir chips, que são elementos de filtro clicáveis, como categorias de pratos.

**Aplicações**: Criar filtros interativos para categorizar os itens do cardápio (Sushi, Ramen, Gohan, etc.).

**Como usar**:

```dart
Padding(
  padding: const EdgeInsets.all(12.0),
  child: Wrap(
    spacing: 10,
    runSpacing: 10, // Garantindo que os chips tenham espaçamento vertical também
    children: [
      Chip(label: Text('Sushi')),
      Chip(label: Text('Ramen')),
      Chip(label: Text('Gohan')),
      Chip(label: Text('Mochi')),
      Chip(label: Text('Wagashi')),
      Chip(label: Text('Dorayaki')),
      Chip(label: Text('Dango')),
    ],
  ),
)
```

**Explicação**:

- O `Wrap` permite que os chips sejam dispostos em várias linhas caso o espaço não seja suficiente, criando uma interface fluída.
    
- Os `Chip` são usados como elementos clicáveis para categorizar o cardápio.
    

## 3. Card (Lista de Pratos)

**Descrição**: O `Card` é usado para exibir os pratos com seus detalhes, como imagem, nome, descrição e preço.

**Aplicações**: Cada prato no cardápio é exibido com uma imagem, uma descrição, um preço e um botão de ação para pedido.

**Como usar**:

```dart
Expanded(
  child: ListView.builder(
    itemCount: pratos.length,
    itemBuilder: (context, index) {
      final prato = pratos[index];
      return Card(
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        elevation: 4,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      prato['imagem']!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          prato['nome']!,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(prato['descricao']!),
                        SizedBox(height: 6),
                        Text(
                          prato['preco']!,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.green[700],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Pedir'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 8,
              top: 8,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Novidades',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      );
    },
  ),
)
```

**Explicação**:

- O `ListView.builder` é utilizado para criar uma lista dinâmica de pratos, permitindo que a lista cresça de acordo com a quantidade de itens.
    
- O `Card` possui uma sombra (definida pela propriedade `elevation`), dando um efeito de profundidade visual.
    
- O `Stack` é usado para sobrepor elementos, como o texto "Novidades", que é posicionado no canto superior direito da imagem do prato.
    
- O `ClipRRect` aplica bordas arredondadas na imagem, enquanto o `Column` organiza o nome, a descrição e o preço do prato.
    

## 4. Botão de Ação (Pedido)

**Descrição**: O botão "Pedir" é exibido ao lado dos detalhes de cada prato, permitindo ao usuário realizar a ação de pedido.

**Aplicações**: A interação do usuário com o botão para fazer um pedido.

**Como usar**:

```dart
ElevatedButton(
  onPressed: () {},
  child: Text('Pedir'),
)
```

**Explicação**:

- O `ElevatedButton` é um botão com efeito de elevação, que responde ao toque do usuário.
    
- O texto "Pedir" dentro do botão descreve claramente a ação que o botão realiza.



## Prototipo02

    

## 1. TextField

**Descrição**:  
Campo de entrada de texto personalizável, utilizado para receber os valores de altura e peso.

**Aplicações**:  
Permite entrada de dados com foco em personalização visual e controle de estilo de digitação.

**Como usar**:

```dart
TextField(
  controller: alturaController,
  keyboardType: TextInputType.number,
  style: TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.black,
  ),
  decoration: InputDecoration(
    labelText: 'Altura (m)',
    labelStyle: TextStyle(color: Colors.black),
    border: OutlineInputBorder(),
  ),
)
```

**Explicação**:

- `style`: define a aparência do texto digitado (negrito e cor preta).
    
- `decoration`: estiliza o rótulo (`labelText`), cor do rótulo (`labelStyle`) e a borda (`OutlineInputBorder`).
    

---

## 2. ElevatedButton

**Descrição**:  
Botão elevado com possibilidade de personalização de cor, forma e texto.

**Aplicações**:  
Usado para ações principais como envio ou cálculo, com destaque visual.

**Como usar**:

```dart
ElevatedButton(
  onPressed: calcularIMC,
  child: Text(
    'Calcular IMC',
    style: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  ),
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.green,
  ),
)
```

**Explicação**:

- `styleFrom`: define a cor de fundo (`backgroundColor`).
    
- `TextStyle`: o texto do botão está em negrito e preto.
    

---

## 3. Text

**Descrição**:  
Componente para exibir texto estático ou dinâmico na interface.

**Aplicações**:  
Usado para exibir mensagens e resultados com personalização de tamanho, cor e peso da fonte.

**Como usar**:

```dart
Text(
  resultado,
  textAlign: TextAlign.center,
  style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  ),
)
```

**Explicação**:

- `textAlign`: centraliza o texto.
    
- `TextStyle`: define o tamanho da fonte, negrito e cor preta.
    

---

## 4. Icon

**Descrição**:  
Ícone usado para transmitir ideias visuais ou reforçar o contexto da tela.

**Aplicações**:  
Adiciona identidade visual à interface (ex: acessibilidade, saúde).

**Como usar**:

```dart
Icon(
  Icons.accessibility_new,
  size: 40,
  color: Colors.green,
)
```

**Explicação**:

- `size`: define o tamanho do ícone.
    
- `color`: cor do ícone (verde).
    

---

## 5. Image.asset

**Descrição**:  
Exibe uma imagem local do projeto com controle de tamanho.

**Aplicações**:  
Mostra imagens de feedback com base no resultado do IMC.

**Como usar**:

```dart
Image.asset(
  imagemResultado!,
  height: 100,
)
```

**Explicação**:

- `height`: define a altura da imagem exibida.
    

---

## 6. AppBar

**Descrição**:  
Barra superior da aplicação com título e ícone decorativo.

**Aplicações**:  
Oferece navegação, identificação e controle visual do cabeçalho.

**Como usar**:

```dart
AppBar(
  title: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'Calculadora de IMC',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      Icon(
        Icons.accessibility_new,
        size: 24,
        color: Colors.white,
      ),
    ],
  ),
  centerTitle: true,
)
```

**Explicação**:

- `TextStyle`: personaliza o texto do título.
    
- `centerTitle`: centraliza o conteúdo no topo da tela.
    
- Uso de `Column` permite empilhar texto e ícone no título da AppBar.
    

---
