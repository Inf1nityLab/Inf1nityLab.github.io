# SemanticTextWidget - Универсальный текстовый виджет с семантикой

## Описание

`SemanticTextWidget` - это универсальный текстовый виджет, который обеспечивает правильную семантику для screen readers и других вспомогательных технологий.

## Основные возможности

- ✅ Автоматическая семантика для screen readers
- ✅ Поддержка заголовков разных уровней (H1-H6)
- ✅ Семантика для кнопок и ссылок
- ✅ Настраиваемые подсказки и метки
- ✅ Предустановленные стили для частых случаев
- ✅ Полная совместимость с существующими стилями

## Базовое использование

```dart
// Простой текст
SemanticTextWidget(
  text: 'Привет, мир!',
  style: AppTextStyles.mobileAppInfo,
)

// Заголовок
SemanticTextWidget(
  text: 'Заголовок страницы',
  isHeading: true,
  headingLevel: 1,
  style: AppTextStyles.sectionHeader,
)

// Кнопка
SemanticTextWidget(
  text: 'Нажми меня',
  isButton: true,
  style: AppTextStyles.buttonPrimaryText,
)

// Ссылка
SemanticTextWidget(
  text: 'Перейти на главную',
  isLink: true,
  style: AppTextStyles.appBarNavItem,
)
```

## Предустановленные варианты

```dart
// Заголовок страницы
SemanticTextPresets.pageTitle('Заголовок')

// Подзаголовок
SemanticTextPresets.subtitle('Подзаголовок')

// Обычный текст
SemanticTextPresets.body('Текст')

// Кнопка
SemanticTextPresets.button('Кнопка')

// Ссылка
SemanticTextPresets.link('Ссылка')

// Подсказка
SemanticTextPresets.hint('Подсказка')

// Ошибка
SemanticTextPresets.error('Ошибка')

// Успех
SemanticTextPresets.success('Успех')
```

## Параметры

### Основные параметры
- `text` - отображаемый текст (обязательный)
- `style` - стиль текста из AppTextStyles
- `role` - семантическая роль (SemanticsRole.alert, SemanticsRole.status и т.д.)
- `semanticLabel` - метка для screen reader

### Семантические параметры
- `isHeading` - является ли заголовком (использует свойство header)
- `headingLevel` - уровень заголовка (1-6)
- `isButton` - является ли кнопкой (использует свойство button)
- `isLink` - является ли ссылкой (использует свойство link)
- `hint` - дополнительная подсказка

### Стилистические параметры
- `textAlign` - выравнивание текста
- `maxLines` - максимальное количество строк
- `overflow` - переполнение текста
- `padding` - внутренние отступы
- `margin` - внешние отступы

## Рекомендации по использованию

1. **Заголовки**: Используйте `isHeading: true` с соответствующим `headingLevel`
2. **Кнопки**: Используйте `isButton: true` для интерактивных элементов
3. **Ссылки**: Используйте `isLink: true` для навигационных элементов
4. **Подсказки**: Используйте `hint` для дополнительной информации
5. **Предустановки**: Используйте `SemanticTextPresets` для стандартных случаев

## Миграция существующего кода

Замените обычные `Text` виджеты на `SemanticTextWidget`:

```dart
// Было
Text('Заголовок', style: AppTextStyles.sectionHeader)

// Стало
SemanticTextWidget(
  text: 'Заголовок',
  style: AppTextStyles.sectionHeader,
  isHeading: true,
  headingLevel: 1,
)
```

## Тестирование доступности

Для тестирования доступности используйте:
- Screen Reader на устройстве
- Flutter Inspector с включенной семантикой
- Автоматические тесты доступности
