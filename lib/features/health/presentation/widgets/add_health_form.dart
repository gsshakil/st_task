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
          FeedBackHelper.showSuccessSnackBar(
            context: context,
            title: 'Success!',
            content: 'Health data added successfully!',
          );
        } else if (state is HealthError) {
          FeedBackHelper.showConfirmationDialog(
            context: context,
            title: 'Error!',
            content: state.error,
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: KTextFormField(
                        controller: sysMmHgController,
                        hintText: 'SYS HG mm',
                        keyboardType: const TextInputType.numberWithOptions(),
                        validator: Validators.compose([
                          Validators.required(context.l10n.titleIsRequired),
                        ]),
                      ).padding(right: 8),
                    ),
                    Expanded(
                      child: KTextFormField(
                        controller: diaMmHgController,
                        hintText: 'DIA HG mm',
                        keyboardType: const TextInputType.numberWithOptions(),
                        validator: Validators.compose([
                          Validators.required(context.l10n.titleIsRequired),
                        ]),
                      ).padding(left: 8),
                    )
                  ],
                ).padding(bottom: 10),
                Row(
                  children: [
                    Expanded(
                      child: KTextFormField(
                        controller: pulseBpmController,
                        hintText: 'Pulse BPM',
                        keyboardType: const TextInputType.numberWithOptions(),
                        validator: Validators.compose([
                          Validators.required(context.l10n.titleIsRequired),
                        ]),
                      ).padding(right: 8),
                    ),
                    Expanded(
                      child: KPrimaryButton(
                        title: 'ADD',
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
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
