flatpak install org.gnome.Sdk/x86_64/42
flatpak install org.gnome.Platform/x86_64/42

flatpak-builder --user --install --force-clean build-dir com.vmware.HorizonClient.yaml