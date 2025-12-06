/**
 * Author: Hazuki Keatsu
 * Data: 2025-12-06
 */

class tabItemClass {
  title: Resource = $r('app.string.default_string');
  unselectedIcon: Resource = $rawfile('icons/empty_placeholder/empty_placeholder.svg');
  selectedIcon: Resource = $rawfile('icons/empty_placeholder/empty_placeholder.svg');

  constructor(title: Resource, unselectedIcon: Resource, selectedIcon: Resource) {
    this.title = title;
    this.unselectedIcon = unselectedIcon;
    this.selectedIcon = selectedIcon;
  }
}

@Entry
@Component
struct Index {
  @State currentIndex: number = 0;
  private tabsController: TabsController = new TabsController();
  private tabItems: Array<tabItemClass> = [
    new tabItemClass($r('app.string.Home_page_Home_page'), $rawfile('icons/house.svg'),
      $rawfile('icons/house_fill.svg')),
    new tabItemClass($r('app.string.Home_page_Club_recommendation'), $rawfile('icons/star.svg'),
      $rawfile('icons/star_fill.svg')),
    new tabItemClass($r('app.string.Home_page_Blog_star'), $rawfile('icons/worldclock.svg'),
      $rawfile('icons/worldclock_fill.svg')),
    new tabItemClass($r('app.string.Home_page_Settings'),
      $rawfile('icons/person.svg'), $rawfile('icons/person_fill.svg')),
  ];

  @Builder
  tabBarBuilder(targetIndex: number, tabItem: tabItemClass) {
    Column() {
      Stack() {
        Column()
          .width(this.currentIndex === targetIndex ? 64 : 24)
          .opacity(this.currentIndex === targetIndex ? 1 : 0)
          .height(30)
          .borderRadius(12)
          .backgroundColor($r('app.color.bottom_navigation_bar_selected_icon'))
          .animation({
            duration: 300,
            curve: Curve.Smooth
          })
        Image(this.currentIndex === targetIndex ? tabItem.selectedIcon : tabItem.unselectedIcon)
          .width(24)
          .height(24)
          .margin(8)
          .fillColor(this.currentIndex === targetIndex ?
            $r('app.color.bottom_navigation_bar_background_color') :
            $r('app.color.bottom_navigation_bar_unselected_icon'))
      }
      Text(tabItem.title)
        .fontFamily('HarmonyHeiTi-Medium')
        .fontSize(10)
        .fontColor(this.currentIndex === targetIndex ?
          $r('app.color.bottom_navigation_bar_selected_icon') :
          $r('app.color.bottom_navigation_bar_unselected_icon'))
        .textAlign(TextAlign.Center)
        .lineHeight(14)
        .fontWeight(400)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .onClick(() => {
      this.currentIndex = targetIndex;
      this.tabsController.changeIndex(targetIndex);
    })
  }

  build() {
    Tabs({ barPosition: BarPosition.End, controller: this.tabsController }) {
      TabContent() {
        Text("Home Page")
      }
      .tabBar(this.tabBarBuilder(0, this.tabItems[0]))

      TabContent() {
        Text("Club Recommendation")
      }
      .tabBar(this.tabBarBuilder(1, this.tabItems[1]))

      TabContent() {
        Text("Blog Star")
      }
      .tabBar(this.tabBarBuilder(2, this.tabItems[2]))

      TabContent() {
        Text("Settings")
      }
      .tabBar(this.tabBarBuilder(3, this.tabItems[3]))
    }
    .vertical(false)
    .divider({
      strokeWidth: 0.5,
      color: $r('app.color.bottom_navigation_bar_divider_color')
    })
    .scrollable(true)
    .onChange((index: number) => {
      this.currentIndex = index
      this.tabsController.changeIndex(index)
    })
    .backgroundColor($r('app.color.bottom_navigation_bar_background_color'))
    .padding({ top: 36 })
  }
}