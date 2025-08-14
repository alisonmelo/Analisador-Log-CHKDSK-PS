
#  Analisador de Log do CHKDSK 🔎

![PowerShell](https://img.shields.io/badge/PowerShell-5.1%2B-blue.svg)

Um script simples e prático em PowerShell para analisar arquivos de log gerados pelo utilitário `CHKDSK` do Windows e apresentar um resumo claro e objetivo.

## O Problema
Os logs do `CHKDSK` podem ser longos e um pouco confusos. Este script lê o arquivo de log para você e destaca as informações mais importantes: se foram encontrados erros, se foram corrigidos e o status dos setores defeituosos.

## Recursos
-   ✅ Analisa o status geral do sistema de arquivos.
-    sectoralerta sobre correções feitas pelo Windows.
-   ⚠️ Destaca a presença de setores defeituosos (bad sectors).
-   🎨 Apresenta um relatório final colorido para fácil visualização.
-   ⚙️ Flexível: Aceita o caminho do arquivo de log como um parâmetro de linha de comando.

## Pré-requisitos
-   Windows
-   PowerShell 5.1 ou superior (já vem instalado no Windows 10 e 11)

## Como Usar
1.  **Baixe o Script:** Faça o download do arquivo `AnalisarLog.ps1` desta página do GitHub.
2.  **Salve o Log:** Salve a saída do seu `CHKDSK` em um arquivo de texto (ex: `meu_log.txt`).
3.  **Abra o PowerShell:** Abra um terminal do PowerShell.
4.  **Execute o Script:** Navegue até a pasta onde você salvou o script e execute o seguinte comando, apontando para o seu arquivo de log:

    ```powershell
    .\AnalisarLog.ps1 -CaminhoDoArquivo "C:\caminho\para\seu\meu_log.txt"
    ```

> **Nota sobre Política de Execução:** Se for a primeira vez que você executa um script no seu computador, talvez precise liberar a permissão. Execute este comando no PowerShell e tente novamente:
> `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process`


### Exemplo de Saída
![Exemplo de como o resultado do script vai aparecer](https://i.imgur.com/NrdyG0z.png)


## Como Contribuir
Sinta-se à vontade para abrir uma "issue" para relatar bugs ou sugerir novas funcionalidades. Pull requests são sempre bem-vindos!

## Licença
Este projeto é distribuído sob a licença MIT. Veja o arquivo `LICENSE` para mais detalhes.
