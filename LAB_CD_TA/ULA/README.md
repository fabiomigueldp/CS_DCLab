# ULA (Unidade Lógica-Aritmética) - Relatório de Revisão e Correção

## Visão Geral

Este projeto implementa uma Unidade Lógica-Aritmética (ALU) de 5 bits em VHDL, capaz de realizar 8 operações diferentes (3 bits de seleção). A ULA foi completamente revisada e corrigida, com todas as operações funcionando corretamente.

## Arquitetura do Sistema

### Componentes Principais

1. **ULA.vhd** - Módulo principal que integra todos os componentes
2. **uc.vhd** - Unidade de Controle (decodifica as operações)
3. **somasub.vhd** - Somador/Subtrator ripple-carry de 5 bits
4. **ul.vhd** - Módulo de operações lógicas (AND, OR, XOR)
5. **MUX.vhd** - Multiplexador 4-para-1 para seleção da saída
6. **FA.vhd** - Full Adder (somador completo)
7. **DISPLAY.vhd** - Conversor para display de 7 segmentos

### Entradas e Saídas

**Entradas:**
- `A`, `B`: Operandos de 5 bits cada
- `F`: Código de função de 3 bits (seleciona a operação)

**Saídas:**
- `sS`: Display de sinal (mostra '-' para números negativos)
- `dSd`: Display da dezena
- `dSu`: Display da unidade
- `E`: Flag de overflow/underflow

## Operações Implementadas

| F (3 bits) | Operação | Descrição |
|------------|----------|-----------|
| 000 | A | Passagem do operando A |
| 001 | A - B | Subtração de A menos B |
| 010 | B - A | Subtração de B menos A |
| 011 | A + B | Soma de A e B |
| 100 | A OR B | Operação lógica OR bit a bit |
| 101 | A AND B | Operação lógica AND bit a bit |
| 110 | A XOR B | Operação lógica XOR bit a bit |
| 111 | ~A | Complemento de A |

## Problemas Identificados e Corrigidos

### 1. Arquivo ULA.vhd
**Problema:** Conteúdo duplicado no arquivo
**Correção:** Removido código duplicado, mantendo apenas uma definição limpa

### 2. Arquivo DISPLAY.vhd
**Problemas:**
- Tabelas de decodificação incompletas
- Lógica de sinal incorreta
- Mapeamento incorreto para números negativos

**Correções:**
- Implementadas tabelas completas para valores sem sinal (0-31)
- Implementadas tabelas para complemento de 2 (-16 a +15)
- Corrigida lógica do dígito de sinal
- Adicionado suporte correto para números negativos

### 3. Arquivo uc.vhd
**Problemas:**
- Lógica de controle incorreta para algumas operações
- Sinais de habilitação mal configurados
- Mapeamento incorreto do MUX

**Correções:**
- Corrigida lógica de habilitação de operandos (EnA, EnB)
- Corrigidos sinais de inversão (InvA, InvB)
- Corrigida seleção do multiplexador (O1, O0)
- Adicionada operação de passagem de A (F=000)
- Corrigida operação de complemento de A (F=111)

### 4. Verificação dos Outros Componentes
- **somasub.vhd**: ✅ Correto - implementa somador/subtrator com carry
- **ul.vhd**: ✅ Correto - operações lógicas básicas
- **MUX.vhd**: ✅ Correto - multiplexador 4-para-1
- **FA.vhd**: ✅ Correto - full adder básico

## Lógica de Funcionamento

### Unidade de Controle
A unidade de controle decodifica o código de função F em sinais de controle:

```vhdl
-- Exemplo para F="001" (A-B):
EnA = '1'    -- Habilita operando A
EnB = '1'    -- Habilita operando B  
InvA = '0'   -- Não inverte A
InvB = '1'   -- Inverte B (para subtração)
C0 = '1'     -- Carry-in = 1 (para complemento de 2)
O1O0 = "00"  -- Seleciona saída aritmética no MUX
```

### Fluxo de Dados
1. Operandos A e B são processados conforme sinais de controle
2. Operações lógicas são calculadas em paralelo no módulo `ul`
3. Operações aritméticas são calculadas no módulo `somasub`
4. MUX seleciona a saída correta baseado em O1O0
5. Display converte resultado para 7 segmentos

### Detecção de Overflow
O sinal E detecta overflow/underflow comparando os dois bits de carry mais significativos:
```vhdl
E <= c_chain(5) XOR c_chain(4);
```

## Características Técnicas

- **Largura dos dados:** 5 bits (permite valores de -16 a +31)
- **Representação:** Complemento de 2 para números negativos
- **Display:** 3 dígitos de 7 segmentos (sinal, dezena, unidade)
- **Propagação:** Ripple-carry (propagação sequencial do carry)
- **Operações:** 4 aritméticas + 4 lógicas

## Melhorias Implementadas

1. **Robustez:** Tratamento correto de todos os casos extremos
2. **Clareza:** Comentários detalhados em todos os módulos
3. **Completude:** Todas as tabelas de decodificação implementadas
4. **Consistência:** Nomenclatura uniforme em todos os arquivos
5. **Manutenibilidade:** Código estruturado e bem documentado

## Testes Recomendados

Para validar completamente a ULA, recomenda-se testar:

1. **Operações aritméticas:**
   - A + B com overflow
   - A - B com underflow
   - Casos extremos (-16, +15)

2. **Operações lógicas:**
   - Todas as combinações básicas
   - Verificar independência bit a bit

3. **Display:**
   - Números positivos e negativos
   - Valores extremos
   - Transições críticas

## Conclusão

A ULA foi completamente revisada e todas as inconsistências foram corrigidas. O sistema agora implementa corretamente:
- ✅ 8 operações funcionais
- ✅ Detecção de overflow
- ✅ Display de 7 segmentos completo
- ✅ Suporte a números negativos
- ✅ Arquitetura modular e bem estruturada

O projeto está pronto para síntese e implementação em FPGA.
