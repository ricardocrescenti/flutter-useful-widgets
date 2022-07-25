import 'package:flutter/material.dart';

class SettingsWidget extends StatelessWidget {

	final List<SettingsGroupModel> groups;

	const SettingsWidget({
		Key? key,
		required this.groups
	}): super(key: key);

	@override
	Widget build(BuildContext context) {

		return ListView.separated(
			itemBuilder: (context, index) => _buildGroup(context, groups[index]),
			separatorBuilder: (context, index) => _buildGroupSeparator(index), 
			itemCount: groups.length
		);

	}

	Widget _buildGroup(BuildContext context, SettingsGroupModel group) {

		return Column(
			mainAxisAlignment: MainAxisAlignment.start,
			crossAxisAlignment: CrossAxisAlignment.start,
			mainAxisSize: MainAxisSize.min,
			children: group.settings.map<Widget>((setting) => _buildSetting(context, setting)).toList(),
		);

	}

	Widget _buildGroupSeparator(int index) {

		return (index < groups.length - 1
			? const Divider()
			: Container());

	}

	Widget _buildSetting(BuildContext context, SettingModel setting) {

		return ListTile(
			title: setting.title,
			subtitle: setting.subtitle,
			trailing: setting.setting,
			onTap: setting.getOnTapFunction(context),
			onLongPress: setting.getOnLongPressFunction(context),
		);

	}
}

class SettingsGroupModel {

	final Widget title;
	final List<SettingModel> settings;

	SettingsGroupModel({
		required this.title,
		required this.settings
	});

}

class SettingModel {

	final Widget title;
	final Widget subtitle;
	final Widget? setting;
	final Function(BuildContext context, SettingModel setting)? onTap;
	final Function(BuildContext context, SettingModel setting)? onLongPress;

	SettingModel({
		required this.title,
		required this.subtitle,
		this.setting,
		this.onTap,
		this.onLongPress
	});

	getOnTapFunction(BuildContext context) {

		if (onTap == null) {
			return null;
		}
		return () => onTap!(context, this);

	}

	getOnLongPressFunction(BuildContext context) {

		if (onLongPress == null) {
			return null;
		}
		return () => onLongPress!(context, this);

	}
}