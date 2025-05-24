import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/view/widgets/buttons/rounded_border_button.dart';
import 'package:portfolio/view/widgets/text_field/leave_a_message_textfield.dart';
import 'package:portfolio/view/widgets/utils_components/loading_widget.dart';
import '../../../common/constants/sizes.dart';
import '../../../common/constants/texts.dart';
import '../../../controllers/body_controller.dart';
import '../../../controllers/layout_controller.dart';
import '../../../utils/utils_func.dart';
import '../../widgets/animations/scroll_entrance_animation.dart';
import '../../widgets/buttons/primary_button.dart';

class DesktopContactMenu extends StatelessWidget {
  const DesktopContactMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final layoutController = LayoutController.instance;
    final bodyController = BodyController.instance;
    return Padding(
      padding: EdgeInsets.only(right: Sizes.defaultSpaceD, top: Sizes.spaceBtwSectionsD * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            spacing: Sizes.spaceBtwItems,
            children: [
              Icon(
                Icons.contact_support_outlined,
                size: context.textTheme.labelMedium!.fontSize,
              ),
              Text(
                "Contact",
                style: context.textTheme.labelMedium,
              )
            ],
          ),
          SizedBox(height: Sizes.spaceBtwItems,),

          ScrollEntrance(
            child: Text("Let's make something awesome together!",
              style: GoogleFonts.montserrat(textStyle: context.textTheme.displayLarge!.copyWith(fontSize: 35)),
            ),
          ),

          SizedBox(height: Sizes.defaultSpaceD,),

          ScrollEntrance(
            child: Form(
              key: bodyController.formKey,
                child: Column(children: [
                  Row(children: [
                    Expanded(
                        child: ContactTextField(
                          hintText: "Your Name *",
                          controller: bodyController.messageTextControllers[0],
                          keyboardType: TextInputType.name,
                        )
                    ),
                    SizedBox(width: Sizes.defaultSpaceD,),
                    Expanded(
                        child: ContactTextField(
                          hintText: "Company Name",
                          controller: bodyController.messageTextControllers[1],
                          keyboardType: TextInputType.name,
                          validator: (text) => UtilsFunc.textFieldValidator(text??'', false),
                        )
                    )
                  ],),
            
                  SizedBox(height: Sizes.defaultSpaceD,),
            
                  Row(children: [
                    Expanded(
                        child: ContactTextField(
                          hintText: "Email Address *",
                          controller: bodyController.messageTextControllers[2],
                          keyboardType: TextInputType.emailAddress,
                        )
                    ),
                    SizedBox(width: Sizes.defaultSpaceD,),
                    Expanded(
                        child: ContactTextField(
                          hintText: "Phone Number *",
                          controller: bodyController.messageTextControllers[3],
                          keyboardType: TextInputType.phone,
                        )
                    )
                  ],),
            
                  SizedBox(height: Sizes.defaultSpaceD,),
            
                  ContactTextField(
                    hintText: "Leave a message *",
                    maxLines: 5,
                    controller: bodyController.messageTextControllers[4],
                  ),
                ],)
            ),
          ),

          SizedBox(height:Sizes.spaceBtwItems),

          ScrollEntrance(
            child: Obx(
              ()=> PrimaryButton(
                text: "Send Message",
                icon: Icons.send_outlined,
                trailWidget: bodyController.isMessageSending.value
                    ?Loaders.circularLoader(width: context.textTheme.labelLarge!.fontSize, strokeWidth: 2):null,
                onTap: bodyController.sendMessage,
              ),
            ),
          ),

          SizedBox(key: layoutController.socialContactWidgetKey, height: Sizes.spaceBtwSectionsD * 2,),

          ScrollEntrance(
            child: Row(
              spacing: Sizes.spaceBtwItems,
              children: [
              socialContactWidget(context, FontAwesomeIcons.whatsapp, bodyController.contacts.whatsappContactUrl??Texts.whatsappContactUrl),
              socialContactWidget(context, FontAwesomeIcons.xTwitter, bodyController.contacts.xProfileUrl??Texts.xProfileUrl),
              socialContactWidget(context, FontAwesomeIcons.instagram, bodyController.contacts.igProfileUrl??Texts.igProfileUrl),
              socialContactWidget(context, FontAwesomeIcons.telegram,  bodyController.contacts.telegramContactUrl??Texts.telegramContactUrl),
              socialContactWidget(context, FontAwesomeIcons.upwork, bodyController.contacts.upworkProfileUrl??Texts.upworkProfileUrl),
              ],),
          ),

          SizedBox(height: Sizes.defaultSpaceD,),

          ScrollEntrance(
            child: SizedBox(
              width: UtilsFunc.deviceWidth(context) * 0.65,
              child:  Text("Want to know more about me, tell me about your project or just to say hello?"
                  " Drop me a line and I 'll get back as soon as possible",
                style: GoogleFonts.montserrat(textStyle: context.textTheme.displayMedium),
              ),
            ),
          ),

          SizedBox(height: Sizes.spaceBtwSectionsD,),

          ScrollEntrance(
            child: Row(children: [
              addressInfo(context, 'Location', bodyController.personalInfo.location??Texts.location),
              Spacer(),
              addressInfo(context, 'Phone', bodyController.contacts.phone??Texts.phone),
              Spacer(),
              addressInfo(context, 'Email', bodyController.contacts.email??Texts.email),
            
                    ],
                  ),
          ),
       ]
      )
    );
  }


  Widget addressInfo(BuildContext context, String title, String text){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: Sizes.smallSpace,
      children: [
        Text(title, style: context.textTheme.titleSmall),
        SelectableText(text, style: context.textTheme.titleMedium)
      ],);
  }

  Widget socialContactWidget(BuildContext context, IconData icon, String link) {
    Rx<Color> iconColor = context.theme.colorScheme.outlineVariant.obs;
    RxBool hovered = false.obs;
    return Expanded(
      child: MouseRegion(
        onEnter: (event) => hovered.value = true,
          onExit: (event) => hovered.value = false,
        child: Obx(
          ()=> RoundedBorderButton(
            elevation: hovered.value?20:null,
            hoverColor: context.theme.colorScheme.surface,
            splashColor: context.theme.colorScheme.surface,
            hasBorder: false,
              borderRadius: Sizes.mdBorderRd,
              height: Sizes.defaultHeightD,
              color: context.theme.colorScheme.surface,
              child: Icon(
                icon,
                size: hovered.value?Sizes.lgIconSize+3:Sizes.lgIconSize,
                color: hovered.value?context.theme.colorScheme.outline:context.theme.colorScheme.outlineVariant,
              ),
            onPressed: () => BodyController.pLaunchUrl(link),
          ),
        ),
      ),
    );
  }
}
