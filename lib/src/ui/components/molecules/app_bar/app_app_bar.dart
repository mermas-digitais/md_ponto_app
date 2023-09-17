import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:md_ponto_app/src/routes/routes.dart';

import '../../atmos/atmos.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(appBarHeight ?? 90.0);

  factory CustomAppBar({
    Key? key,
    final String? title,
    final double? appBarHeight,
    required Widget child,
  }) {
    return CustomAppBar._(
      key: key,
      title: title,
      appBarHeight: appBarHeight,
      child: child,
    );
  }
  factory CustomAppBar.withTitleAndBackButton({
    Key? key,
    required String title,
    final double? appBarHeight,
    required BuildContext context,
  }) {
    return CustomAppBar._(
      key: key,
      appBarHeight: appBarHeight,
      child: AppBar(
        toolbarHeight: appBarHeight ?? 90.0,
        centerTitle: true,
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 22),
        ),
        leadingWidth: 60,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          style: Theme.of(context).iconButtonTheme.style,
          onPressed: () => AppNavigate.pop(),
        ),
      ),
    );
  }
  factory CustomAppBar.withProfileInfo({
    Key? key,
    required String userPhoto,
    required String userfirstName,
    required String userEmail,
    required String userGroup,
    required BuildContext context,
    String? heroTag,
  }) {
    return CustomAppBar._(
      key: key,
      child: PreferredSize(
        preferredSize: const Size.fromHeight(90.0),
        child: Hero(
          tag: "$heroTag",
          child: Padding(
            padding:
                const EdgeInsets.only(right: 20.0, left: 20.0, bottom: 10.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //context / radius / avatar (0 to 9)
                InkWell(
                  customBorder: const CircleBorder(),
                  overlayColor: MaterialStatePropertyAll(
                      Theme.of(context).colorScheme.tertiary),
                  child: ProfileCircleAvatar(
                          context: context, radius: 30, image: userPhoto)
                      .normal(),
                  onTap: () {},
                ),

                const SizedBox(width: 8.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Olá, $userfirstName ",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                            userGroup == 'voluntario'
                                ? 'Monitor voluntário'
                                : 'Monitor bolsista',
                            style: Theme.of(context).textTheme.titleMedium),
                      ],
                    ),
                    // const SizedBox(height: 2.0),
                    Text(userEmail,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 12,
                            color: Theme.of(context)
                                .colorScheme
                                .background
                                .withOpacity(0.8))),
                  ],
                ),

                const Spacer(),
                IconButton(
                  icon: const Icon(Iconsax.user_search),
                  onPressed: () {
                    AppNavigate.to.admin();
                  },
                ),
                const SizedBox(width: 8.0),
                IconButton(
                  style: Theme.of(context).iconButtonTheme.style,
                  icon: const Icon(
                    Iconsax.logout_1,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  //create factory AppBar with title, back button and TabBar
  factory CustomAppBar.withTitleAndBackButtonAndTabBar({
    Key? key,
    required String title,
    final double? appBarHeight,
    required BuildContext context,
    required List<Tab> tabs,
    required TabController tabController,
    String? heroTag,
  }) {
    return CustomAppBar._(
      key: key,
      appBarHeight: appBarHeight,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(-20),
          bottomRight: Radius.circular(-20),
        ),
        child: Hero(
          tag: "$heroTag",
          child: AppBar(
            toolbarHeight: appBarHeight ?? 90.0,
            centerTitle: false,
            title: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: 20),
            ),
            //  leadingWidth: 60,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
              ),
              style: Theme.of(context).iconButtonTheme.style,
              onPressed: () => AppNavigate.pop(),
            ),
            bottom: TabBar(
                tabs: tabs,
                controller: tabController,
                dividerColor: Theme.of(context).colorScheme.primary,
                indicatorColor: Theme.of(context).colorScheme.onPrimary,
                labelColor: Theme.of(context).colorScheme.onPrimary,
                unselectedLabelColor: Theme.of(context).colorScheme.background,
                labelStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                unselectedLabelStyle:
                    Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                physics: const BouncingScrollPhysics()),
          ),
        ),
      ),
    );
  }

  const CustomAppBar._({
    Key? key,
    this.title,
    this.appBarHeight,
    required this.child,
  });

  final String? title;
  final double? appBarHeight;

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(appBarHeight ?? 90.0),
      child: child,
    );
  }
}
