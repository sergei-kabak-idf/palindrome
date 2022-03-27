class BlocData<D> {
  D? data;

  BlocData(this.data);

  void updateParams({
    D? data,
  }) {
    if (data != null) this.data = data;
  }

  BlocData<D> copy<D>() => BlocData(data as D);

  factory BlocData.init() => BlocData<D>(null);
}
