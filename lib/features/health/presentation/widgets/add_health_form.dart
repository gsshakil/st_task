import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:st_task/core/di.dart';
import 'package:st_task/core/extensions/widget_extensions.dart';
import 'package:st_task/core/helpers/feedback_helper.dart';
import 'package:st_task/core/widgets/forms/k_text_form_field.dart';
import 'package:st_task/core/widgets/k_primary_button.dart';
import 'package:st_task/features/health/data/models/health_model.dart';
import 'package:st_task/features/health/presentation/blocs/get_health_cubit/get_health_cubit.dart';
import 'package:st_task/features/health/presentation/blocs/health_cubit/health_cubit.dart';
import 'package:st_task/l10n/l10n.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class AddHealthForm extends StatefulWidget {
  const AddHealthForm({
    super.key,
  });

  @override
  State<AddHealthForm> createState() => _AddHealthFormState();
}

class _AddHealthFormState extends State<AddHealthForm> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController sysMmHgController = TextEditingController();
  final TextEditingController diaMmHgController = TextEditingController();
  final TextEditingController pulseBpmController = TextEditingController();

  final healthCubit = injector<HealthCubit>();
  final getHealthCubit = injector<GetHealthCubit>();

  @override
  void dispose() {
    sysMmHgController.dispose();
    diaMmHgController.dispose();
    pulseBpmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HealthCubit, HealthState>(
      listener: (context, state) {
        if (state is HealthSuccess) {
          getHealthCubit.getAllHealthData();
          FocusManager.instance.primaryFocus?.unfocus();
          sysMmHgController.clear();
          diaMmHgController.clear();
          pulseBpmController.clear();
        } else if (state is HealthError) {
          FeedBackHelper.showConfirmationDialog(
            context: context,
            title: context.l10n.error,
            content: state.error,
          );
        }
      },
      builder: (context, state) {
        return Container(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    _buildSysHgTextFormField(context),
                    _buildDiaHGTextFormField(context)
                  ],
                ).padding(bottom: 10),
                Row(
                  children: [
                    _buildPulseBpmTextFormField(context),
                    _buildAddButton(state)
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Expanded _buildAddButton(HealthState state) {
    return Expanded(
      child: KPrimaryButton(
        title: context.l10n.add,
        isLoading: state is HealthLoading,
        onPressed: () {
          if (formKey.currentState!.validate()) {
            if (state is HealthLoading) return;
            healthCubit.insertHealthData(
                healthModel: HealthModel(
              sysMmHg: sysMmHgController.text.trim(),
              diaMmHg: diaMmHgController.text.trim(),
              pulseBpm: pulseBpmController.text.trim(),
            ));
          }
        },
      ).padding(left: 8),
    );
  }

  Expanded _buildPulseBpmTextFormField(BuildContext context) {
    return Expanded(
      child: KTextFormField(
        controller: pulseBpmController,
        hintText: context.l10n.pulse,
        keyboardType: const TextInputType.numberWithOptions(),
        inputAction: TextInputAction.next,
        validator: Validators.compose([
          Validators.required(context.l10n.thisFieldIsRequired),
        ]),
      ).padding(right: 8),
    );
  }

  Expanded _buildDiaHGTextFormField(BuildContext context) {
    return Expanded(
      child: KTextFormField(
        controller: diaMmHgController,
        hintText: 'DIA',
        keyboardType: const TextInputType.numberWithOptions(),
        inputAction: TextInputAction.next,
        validator: Validators.compose([
          Validators.required(context.l10n.thisFieldIsRequired),
        ]),
      ).padding(left: 8),
    );
  }

  Expanded _buildSysHgTextFormField(BuildContext context) {
    return Expanded(
      child: KTextFormField(
        controller: sysMmHgController,
        hintText: 'SYS',
        keyboardType: const TextInputType.numberWithOptions(),
        inputAction: TextInputAction.next,
        validator: Validators.compose([
          Validators.required(context.l10n.thisFieldIsRequired),
        ]),
      ).padding(right: 8),
    );
  }
}
