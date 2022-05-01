# Memorize (найди пару) проект для защиты
Медленно, но настойчиво погружаемся в декларативное описание UI, которое проповедует SwiftUI.

Зделать локальную версию

- Игра (логика, подсчет очков)
- Меню (side bar menu)
    - Реализация через TabView (все представления загружаются сразу)  
- Уведомления (+ анимация)
    - Запрос requestAuthorization [.alert, .badge, .sound]
    - UNMutableNotificationContent - Создание содержимого для локального уведомления
    - ScenePhase - жизненный цикл SwiftUI
    - Реализация UNUserNotificationCenterDelegate без AppDelegate в SwiftUI
    - Запоминаем установлен ли будильник
- Onboarding
    - Появляеться только у не авторизованных пользователей
- Правила
    - Чем меньше, тем лучше
    - Красивое движение фона при скроле
- Выбор темы
    - анимированные карточки
    - сохранение текущей темы в UserDefaults
    - реактивный UI (выбирая тему - View везде перерисовывает цвет)
    <img src="https://github.com/ihValery/Memorize/blob/main/Memorize/ImageForReadme/previewApp.png?raw=true"></a>
- Окно регистрации/авторизации
    - Интегрировал фреймвлрк Combine
    - Познакомился с «издателями» Publishers, «подписчиками» Subscribers и операторами
    - Полностью катомизированные textField's
    - Тяжелая анимация, для сглаживание активирован Metal
    - GeometryReader и использование его пространства
    - ButtonStyle кастомизация кнопки огранченна лишь фантазией, взялся - тогда анимацию и другие плюшки берешь на себя
    <img src="https://github.com/ihValery/Memorize/blob/main/Memorize/ImageForReadme/AuthMemory.png"></a>
    - Firebase авторизация + firestore (база данных юзер с доп. полями) + storage (для хранения медиа файлов)
    - Проверка Auth.auth().addStateDidChangeListener. не автоизированны? тогда выскочит окно ))).
    - Познакомился с ImagePicker (доступ к библиотеке фотографий).
    - Выбор фотки и последующая загрузка в профайл. (+ доп. поля)
    - Загрузка фотографии и кеширование.
    - .popover и .fullScreenCover vs .sheet
    - презентация
    
    <img src="https://github.com/ihValery/CombineFirebase/blob/main/Lesson39Preview.gif?raw=true"></a>
    <img src="https://github.com/ihValery/Memorize/blob/main/Memorize/ImageForReadme/NewTheme75.gif?raw=true"></a>
