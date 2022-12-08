import 'dart:math';

import 'package:flutter/material.dart';
import '../models/tagihan_model.dart';
import '/theme.dart';

class TagihanPasienScreen extends StatelessWidget {
  const TagihanPasienScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<TagihanModel> appointmentListData = List.generate(50, (index) {
      return TagihanModel(
          idTagihan: 'Inv-$index',
          status: status[Random().nextInt(status.length)],
          tanggalDibuat: DateTime.now());
    });

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: appBarWidget(),
      body: bodyWidget(appointmentListData),
    );
  }

  ListView bodyWidget(List<TagihanModel> appointmentListData) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(defaultMargin),
      itemCount: appointmentListData.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(top: defaultMargin),
          padding: const EdgeInsets.all(defaultMargin / 2),
          decoration: BoxDecoration(
            color: kWhiteColor,
            boxShadow: [kShadow],
            borderRadius:
                const BorderRadius.all(Radius.circular(defaultCircular)),
          ),
          child: ListTile(
            onTap: () {
              snackBarWidget(context);
            },
            shape: RoundedRectangleBorder(
              borderRadius: kBorderRadius,
            ),
            title: itemContentWidget(
                appointmentListData[index].idTagihan,
                appointmentListData[index].status,
                appointmentListData[index].tanggalDibuat),
            trailing: trailingButtonWidget(context),
          ),
        );
      },
    );
  }

  AppBar appBarWidget() {
    return AppBar(
      backgroundColor: kPrimaryColor,
      leading: IconButton(
          onPressed: () {}, icon: Icon(Icons.arrow_back, color: kWhiteColor)),
      centerTitle: false,
      title: Text(
        'Daftar Tagihan Pasien',
        style: whiteTextStyle.copyWith(fontSize: 20),
      ),
    );
  }

  Widget trailingButtonWidget(BuildContext context) {
    return TextButton(
      onPressed: () {
        snackBarWidget(context);
      },
      child: Text(
        'Lihat Detail',
        style: buttonTextStyle,
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackBarWidget(
      BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: kDangerColor,
        content: Text(
          'Dalam Perbaikan',
          style: whiteTextStyle,
        ),
      ),
    );
  }

  Column itemContentWidget(String? idTagihan, String? status, DateTime? waktu) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Chip(
          label: Text(
            status?.toUpperCase() ?? '-',
            style: whiteTextStyle,
          ),
          backgroundColor:
              status?.contains('B') ?? false ? kSecondaryColor : kPrimaryColor,
        ),
        const SizedBox(
          height: defaultMargin / 2,
        ),
        Text('$idTagihan ',
            style: blackTextStyle.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(
          height: defaultMargin / 4,
        ),
        Text('Tanggal Terbuat : ',
            style: blackTextStyle.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(
          height: 3,
        ),
        Text(
          ' ${waktu?.day ?? 0} - ${waktu?.month} - ${waktu?.year ?? 0}  ${waktu?.hour ?? 0}:${waktu?.second ?? 0}',
          style: blackTextStyle,
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
        ),
      ],
    );
  }
}
