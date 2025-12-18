import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_litera/core/constants/app_colors.dart';
import 'package:flutter_litera/features/hub/presentation/bloc/hub_bloc.dart';

class LocationSection extends StatelessWidget {
  const LocationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HubBloc, HubState>(
      builder: (context, state) {
        String displayLocation = "Memuat lokasi...";

        if (state is HubNameLoaded) {
          displayLocation = state.hubName;
        } else if (state is HubInitial) {
          displayLocation = "-";
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              const Icon(Icons.location_on, color: AppColors.primary, size: 18),
              const SizedBox(width: 8),
              const Text(
                "Lokasi Anda: ",
                style: TextStyle(color: AppColors.textGrey, fontSize: 12),
              ),
              Expanded(
                child: Text(
                  displayLocation,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textMain,
                    fontSize: 12,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Icon(
                Icons.keyboard_arrow_down,
                color: AppColors.textGrey,
                size: 18,
              ),
            ],
          ),
        );
      },
    );
  }
}
